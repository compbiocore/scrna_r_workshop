FROM rocker/rstudio:4.0.3

USER root

WORKDIR /home/rstudio

#install some base libs
RUN apt-get update && \
	apt-get -y --no-install-recommends install --fix-missing \
        apt-file \
        apt-utils \
        build-essential \
        bzip2 \
        ca-certificates \
        cmake \
        curl \
	default-jdk \
        default-jre\
        gdb \
        git \
        hdf5-helpers \
        lbzip2 \
        libbz2-dev \
        libcairo2-dev \
        libcurl4-openssl-dev \
        libfftw3-dev \
        libgeos-dev \
        libgl1-mesa-dev \
        libglpk-dev \
        libglu1-mesa-dev \
        libgsl0-dev \
        libhdf4-alt-dev \
        libhdf5-dev \
        libjpeg-dev \
        libjq-dev \
        liblzma-dev \
        libmariadbd-dev \
        libnetcdf-dev \
        libpng-dev \
        libpq-dev \
        libproj-dev \
        libprotobuf-dev \
        libsqlite3-dev \
        libssh2-1-dev \
        libssl-dev \
        libudunits2-dev \
        libxml2-dev \
        libxt-dev \
        libz-dev \
        make \
        netcdf-bin \
        postgis \
        protobuf-compiler \
        python3-pip \
        sqlite3 \
        tk-dev \
        unixodbc-dev \
        unzip \
        vim \
        libpoppler-cpp-dev \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

# FFTW, FIt-SNE
RUN wget http://www.fftw.org/fftw-3.3.8.tar.gz \
    && tar zxvf fftw-3.3.8.tar.gz \
    && rm fftw-3.3.8.tar.gz \
    && cd fftw-3.3.8 \
    && ./configure \
    && make \
    && make install \
    && git clone https://github.com/KlugerLab/FIt-SNE.git \
    && cd FIt-SNE/ \
    && g++ -std=c++11 -O3  src/sptree.cpp src/tsne.cpp src/nbodyfft.cpp  -o bin/fast_tsne -pthread -lfftw3 -lm \
    && cp bin/fast_tsne /usr/local/bin/

# Install R packages
RUN R -e "install.packages('BiocManager', dependencies=TRUE, repos='http://cran.rstudio.com/', ask = FALSE)"
RUN R -e "install.packages('devtools', dependencies=TRUE, repos='http://cran.rstudio.com/', ask = FALSE)"

RUN R -e "BiocManager::install(c('clusterProfiler','GenomicFeatures','enrichplot','DOSE','BSgenome','BSgenome.Hsapiens.UCSC.hg19','airway','enrichplot','ensembldb','GenomeInfoDb','DESeq2','vsn','airpart','glmGamPoi','MAST','multtest','AnnotationHub','biomaRt', 'rhdf5', 'ensembldb', 'SingleCellExperiment', 'AUCell', 'RcisTarget', 'GENIE3', 'zoo', 'mixtools', 'rbokeh', 'DT', 'NMF', 'ComplexHeatmap', 'R2HTML', 'Rtsne', 'doMC', 'doRNG', 'BiocGenerics', 'DelayedArray', 'DelayedMatrixStats', 'limma', 'S4Vectors', 'SummarizedExperiment', 'batchelor', 'Matrix.utils', 'TFBSTools', 'JASPAR2018', 'scater'))"

RUN R -e "install.packages(c('maps', 'pillar', 'gridExtra','metap','arrow', 'RcppArmadillo', 'deldir', 'Seurat', 'hdf5r', 'patchwork','tidyverse', 'ggrepel','sctransform', 'remotes', 'knitr', 'kableExtra', 'stringr', 'plotly','viridis', 'parallel', 'pdftools', 'openxlsx'), repos = 'http://cran.rstudio.com/', ask = FALSE)"

RUN R -e "devtools::install_github('mojaveazure/seurat-object', quiet = TRUE)"
RUN R -e "devtools::install_github('immunogenomics/harmony', quiet = TRUE)"
RUN R -e "devtools::install_github('mojaveazure/seurat-disk', quiet = TRUE)"
RUN R -e "devtools::install_github('satijalab/seurat-data@d6a8ce61ccb21a3b204f194d07009772c822791d', quiet = TRUE)"
RUN R -e "devtools::install_github('xzhoulab/iDEA', quiet = TRUE)"
RUN R -e "devtools::install_github('lucylgao/clusterpval', quiet = TRUE)"
RUN R -e "devtools::install_github('ctlab/fgsea', quiet = TRUE)"


RUN wget http://seurat.nygenome.org/src/contrib/pbmc3k.SeuratData_3.1.4.tar.gz
RUN R -e "install.packages('pbmc3k.SeuratData_3.1.4.tar.gz', repos = NULL, type = 'source')"


RUN wget http://seurat.nygenome.org/src/contrib/pbmcref.SeuratData_1.0.0.tar.gz 
RUN R -e "install.packages('pbmcref.SeuratData_1.0.0.tar.gz', repos = NULL, type = 'source')"

RUN wget http://seurat.nygenome.org/src/contrib/cbmc.SeuratData_3.1.4.tar.gz
RUN R -e "install.packages('cbmc.SeuratData_3.1.4.tar.gz', repos = NULL, type = 'source')"

RUN wget http://seurat.nygenome.org/src/contrib/ifnb.SeuratData_3.1.0.tar.gz
RUN R -e "install.packages('ifnb.SeuratData_3.1.0.tar.gz', repos = NULL, type = 'source')"



