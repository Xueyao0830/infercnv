library(infercnv)
library(rjags)
library(reticulate)
library(Seurat)
setwd('input_dir')
Sys.setenv("DISPLAY"="localhost:17.0")
options(bitmapType="Xlib")
infercnv_obj = CreateInfercnvObject(raw_counts_matrix='matrix_file.txt',
                                    annotations_file='annotations_file.txt',
                                    delim="\t",
                                    gene_order_file='ordered_genes_feb.txt',
                                    ref_group_names=NULL)

infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=0.1, 
                             out_dir=out_dir, 
                             hclust_method='ward.D2',
                             #partition the hierarchical clustering trees
                             tumor_subcluster_partition_method='random_trees',
                             tumor_subcluster_pval=0.05,#cut-points in the hierarchical tree
                             cluster_by_groups=TRUE,
                             #partition cells into groups having consistent patterns of CNV
                             analysis_mode="subclusters", 
                             denoise=TRUE,
                             HMM=TRUE,
                             HMM_type='i6',
                             window_length=101,
                             num_threads=15,
                             output_format='pdf')
