i=1
for id in *gz
do 
echo `date` "start do QC for " $id
/home/software/FastQC/fastqc $id
echo `date` "end do QC for " $id
i=$((i+1))
done 