work_dir=/home/pipeline/snp-calling
reference=/home/data/database/hg19.fasta   
bwa_dir=$work_dir/software/bwa-0.7.11
picard_dir=$work_dir/software/picard-tools-1.119
for i in *.sorted.bam
do
echo $i
nohup java  -Xmx60g  -jar $picard_dir/MarkDuplicates.jar \
CREATE_INDEX=true REMOVE_DUPLICATES=True \
ASSUME_SORTED=True VALIDATION_STRINGENCY=LENIENT  \
I=$i OUTPUT=${i%%.*}.dedup.bam METRICS_FILE=tmp.metrics 1>>${i%%.*}.MarkDuplicates.log 2>&1 &
done 
