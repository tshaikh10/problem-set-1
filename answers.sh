#! /usr/bin/env bash 

datasets="$HOME/data-sets"
# Which state in `states.tab.gz` has the lowest murder rate?

states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -n1 \
    | cut -f1) 

echo "answer-1: $answer_1"


# How many sequence records are in the `sample.fa` file?

sequencerecords="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sequencerecords | wc -l)

echo "answer-2:$answer_2"



# How many unique CpG IDs are in `cpg.bed.gz`?

uniqueCpG="$datasets/bed/cpg.bed.gz"

answer_3=$(gzcat $uniqueCpG | cut -f4| sort -k1nr | uniq -c|wc -l)

echo "answer-3:$answer_3"


#How many sequence records are in the `SP1.fq` file?


sequencerecordsSP1="$datasets/fastq/SP1.fq"

answer_4=$(cat $sequencerecordsSP1| grep '@cluster'|wc -l)

echo "answer-4:$answer_4"


#How many words are on lines containing the word `bloody` in `hamlet.txt`?

bloodywords="$datasets/misc/hamlet.txt"

answer_5=$(grep -e 'bloody' $bloodywords |wc -w)

echo "answer-5:$answer_5"


#What is the length of the sequence in the first record of `sample.fa`?

seqlengthL1="$datasets/fasta/sample.fa"

answer_6=$(grep -v '^>' $seqlengthL1 |head -n 1|wc -c)

echo "answer-6:$answer_6"


#What is the name of the longest gene in `genes.hg19.bed.gz`?

longestgene="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(gzcat $longestgene \
|cut -f4 \
|awk '{print length,$0}' \
|sort -rn \
|awk '{$1="";print $0}' \
|head -n 1)

echo "answer-7:$answer_7"


#How many unique chromosomes are in `genes.hg19.bed.gz`?

uniquechromosomes="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(gzcat $uniquechromosomes \
|cut -f1|uniq -c|awk '{$1="";print $0}'|wc -l)

echo "answer-8:$answer_8"


#How many intervals are associated with CTCF (**not** CTCFL) in `peaks.chr22.bed.gz`?

CTCFintervals="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(gzcat $CTCFintervals \
|cut -f4|sort -n|uniq -c|awk '($2 == "CTCF")'|awk '{$2="";print $0}')

echo "answer-9:$answer_9"


#On what chromosome is the largest interval in `lamina.bed`?

largestinterval="$datasets/bed/lamina.bed"

answer_10=$(grep -v '^#' $largestinterval\
|awk '{interval = $3 - $2} {print $1, interval}'|sort -k2rn \
|awk '{$2 ="";print $0}'|head -n 1)


echo "answer-10:$answer_10"



