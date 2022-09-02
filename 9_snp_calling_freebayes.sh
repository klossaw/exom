#9.snp-calling by freebayes
reference=/home/data/database/hg19.fasta
for i in *.realgn.bam
do
echo $i 
nohup /home/software/freebayes/bin/freebayes -f $reference $i 1>${i%%.*}.freebayes.vcf 2>${i%%.*}.freebayes.log &  
done 
