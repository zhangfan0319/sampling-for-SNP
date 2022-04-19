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
