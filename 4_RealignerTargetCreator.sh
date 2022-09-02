work_dir=/home/pipeline/snp-calling
reference=/home/data/database/hg19.fasta   
bwa_dir=$work_dir/software/bwa-0.7.11
picard_dir=$work_dir/software/picard-tools-1.119
gatk=$work_dir/software/gatk/GenomeAnalysisTK.jar
for i in *.dedup.bam
do
echo $i
nohup java -Xmx60g -jar $gatk \
-R $reference \
-T RealignerTargetCreator \
-I $i -o ${i%%.*}.intervals \
-known /home/ldzeng/EXON/ref/1000G_phase1.indels.hg19.sites.vcf 1>>${i%%.*}.RealignerTargetCreator.log 2>&1 &
done 
