# scRNAseq in R Workshop        

This repository contains R markdown files for the analysis of scRNAseq data (mainly in Seurat). It was developed by the [Computational Biology Core](http://cbc.brown.edu/) and is based mainly on the Seurat vignettes https://satijalab.org/seurat and GitHub repository https://github.com/satijalab/seurat. 

### Learning Objectives    

**Introduction to scRNA-seq (intro.Rmd)**    
- Understanding the difference between bulk and scRNAseq.
- Familiarity with 10x Genomics gene expression library preparation.
- Familiarity with cellranger outputs and importing them into R.
- Deep knowledge of Seurat object structure and data storage.
- Understanding of metrics for QCing and filtering data.
- Merging and integrating multiple datasets, the difference between them, $and when they are appropriate to use.
- Understanding of how and why we normalize data using SCTransform.
- Data visualization functions in Seurat and their default behaviors.

**Advanced topics in single-cell analysis (advanced_topics.Rmd)**
- Understanding of parallelization options in Seurat and other R packages.
- Familiarity with 10x Genomics multimodal data library preparation.
- Importing CITE-seq data in Seurat.
- How to run CLR transformation of CITE-seq data and the distinction between normalizing over features or cells.
- A brief introduction to some up-and-coming methods to control for Type I error rate in estimated clusters
- Understanding how to classify cell types using Seurat TransferAnchors and the distinction between data transfer and data integration.
- Understanding the distinction between over representation analysis and gene set enrichment and their appropriateness for scRNAseq analysis.

### Prior workshop dates and associated notebooks

| Date                         | Workshop                                                 | Title                                   | Notebook            | Commit  |
|------------------------------|----------------------------------------------------------|-----------------------------------------|---------------------|---------|
| June 10th 2022, 1-2:30 PM    | CCV Bootcamp (https://docs.ccv.brown.edu/bootcamp-2022/) | Introduction to scRNA-seq               | intro.Rmd           | e89ca39 |
| June 10th 2022, 2:30-4:00 PM | CCV Bootcamp (https://docs.ccv.brown.edu/bootcamp-2022/) | Advanced topics in single-cell analysis | advanced_topics.Rmd | e89ca39 |                                            

