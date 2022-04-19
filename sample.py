##sys_sample.py
import random
import numpy as np
import pandas as pd

def systemSampling(length,number):
    if number==0:
        return []
    k=int(length/number)
    sample=[]
    i=0
    if k>0:
        while (i<number):
            sample.append(0+i*k)
            i+=1
        return sample
    else:
        return repetRandomSampling(dataMat,number)

a=pd.read_csv("SNPdensity", sep='\t')
data=a.to_numpy()
print(data.shape)
result_list=[]
for i in range(data.shape[0]):
    length = data[i, 2]
    #print("length", length)
    ratio=bili
    sample_size=np.ceil(length*ratio)
    #print("sample_size", sample_size)
    sample_idx = systemSampling(length,sample_size)
    idx = np.zeros((int(length),)).astype(np.int32)
    idx[sample_idx]=int(1)
    result_list = result_list + list(idx)
#print(result_list)
#result=np.zeros(snp.shape)
snp=pd.read_csv("snp.txt",sep=' ')
a0=snp['chr']
a1=snp['pos']
result=np.zeros((a0.shape[0], 3))
result[:,0]=a0
result[:,1]=a1
result[:,2]=np.array(result_list)
result = result[np.where(result[:,2]==1)]
np.savetxt("SNPdensity_bili.txt",result[:,0:2],fmt='%d %d')

