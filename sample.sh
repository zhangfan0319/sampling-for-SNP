cat ../gblup/QC2.bim |awk '{print $1,$4,$2}' > snp.txt
snp.txt 文件加表头
####计算不同windows的SNP数目
for i in 20000 40000 60000 80000 100000
do
vcftools --gzvcf my.gz --out SNPdensity_${i} --SNPdensity ${i} &
done
wait

ls

######利用python脚本获取SNP集合

for i in 20000 40000 60000 80000 100000
do
for j in 0.5 0.2 0.1 0.05 0.01 0.005 
do
sed  s/SNPdensity/SNPdensity_${i}/g  sys_sample.py  >sys_sample_${i}.py
sed  s/bili/${j}/g sys_sample_${i}.py > sys_sample_${i}_${j}.py
python sys_sample_${i}_${j}.py &
done
wait
done

####利用Plink获取目标SNP的二进制文件

for i in `cat list`   
do
plink --bfile IndepSNP --extract ${i}.txt --make-bed --out $i --allow-extra-chr --chr-set 40 &
done
wait

for i in `cat list`
do
plink --bfile ${i} --allow-extra-chr --chr-set 40 --recodeA --out ${i} &
done
wait
