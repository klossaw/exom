#10. Call SNPs using Unified Genotyper
work_dir=/home/pipeline/snp-calling
reference=/home/data/database/hg19.fasta   
bwa_dir=$work_dir/software/bwa-0.7.11
picard_dir=$work_dir/software/picard-tools-1.119
gatk=$work_dir/software/gatk/GenomeAnalysisTK.jar
for i in *.realgn.bam
do
echo $i 
java -Xmx60g -jar $gatk \
-T UnifiedGenotyper -R $reference \
-I $i -o ${i%%.*}.gatk.UG.vcf \
   -stand_call_conf 30.0 \
   -stand_emit_conf 0 \
   -glm BOTH \
   -rf BadCigar 
done 
