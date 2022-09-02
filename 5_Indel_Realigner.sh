work_dir=/home/pipeline/snp-calling
reference=/home/data/database/hg19.fasta   
bwa_dir=$work_dir/software/bwa-0.7.11
picard_dir=$work_dir/software/picard-tools-1.119
gatk=$work_dir/software/gatk/GenomeAnalysisTK.jar
for i in *.dedup.bam
do
echo $i
nohup java -Xmx60g -jar $gatk \
-R $reference -T IndelRealigner \
-I $i \
-targetIntervals ${i%%.*}.intervals -o ${i%%.*}.realgn.bam  1>>${i%%.*}.IndelRealigner.log 2>&1 &
done 
