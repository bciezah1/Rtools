#Author: Basilio Cieza Huaman
#email: bciezah@gmail.com

#note: this code take a list of ENS gene and convert them to SYMBOL list


rename_gene_column <- function(input_file, output_file) {
  # Load input file
  file <- read.csv(input_file)
  
  # Extracting column with Ensembl name
  ens_list <- file$ID
  symbol_list <- clusterProfiler::bitr(ens_list, fromType='ENSEMBL', toType='SYMBOL', OrgDb=org.Hs.eg.db)
  names(symbol_list) <- c('ID', 'SYMBOL')
  
  # Merging new symbol to the old Ensembl symbol
  new_file <- merge(file, symbol_list, by='ID', all.x=TRUE)
  new_file_filtered <- new_file[, c('ID', 'SYMBOL')]
  
  # Writing out to a file
  write.csv(new_file_filtered, output_file, row.names=FALSE)
}

# Loading libraries
library("org.Hs.eg.db", character.only = TRUE)

# Example usage:
input_file_path <- "C:/Users/bciez/Documents/Basilio/Columbia_University/rna_seq/BulkRNAseq/input/ADNI/exp_and_clinical_data_cleaned_ready_to_use_ml_v1_11_30_2023_genes_list.csv"
output_file_path <- "ADNI_ENStoSYMBOL_test.csv"
rename_gene_column(input_file_path, output_file_path)

