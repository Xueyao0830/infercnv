library(infercnv)
library(rjags)
library(reticulate)
library(Seurat)
#Sys.setenv("DISPLAY"="localhost:16.0")
#options(bitmapType="Xlib")
setwd('/Users/xueyao.wang/Documents/project/mechanism_metastasis_nb/scripts.d/infercnv')
out_dir <- '/Users/xueyao.wang/Documents/project/mechanism_metastasis_nb/scripts.d/infercnv/out'
infercnv_obj = CreateInfercnvObject(raw_counts_matrix='matrix_file_leiden.txt',
                                    annotations_file='annotations_file_leiden.txt',
                                    delim="\t",
                                    gene_order_file='gene_postision.txt',
                                    ref_group_names=NULL)
saveRDS(infercnv_obj, file = "/Users/xueyao.wang/Documents/project/mechanism_metastasis_nb/scripts.d/infercnv/infer_obj.rds")

infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=0.1,
                             out_dir=out_dir,
                             #partition the hierarchical clustering trees
                             cluster_by_groups=T,
                             #partition cells into groups having consistent patterns of CNV
                             window_length=101,
                             num_threads=5,
                             plot_steps=F,
                             output_format='pdf')
