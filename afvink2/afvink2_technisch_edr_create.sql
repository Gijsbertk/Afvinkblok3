-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-02-21 09:27:33.136

-- tables
-- Table: HL
CREATE TABLE HL (
    Host_lineage_id int NOT NULL,
    Host_lineage Varchar(20) NOT NULL,
    CONSTRAINT HL_pk PRIMARY KEY (Host_lineage_id)
);

-- Table: Host
CREATE TABLE Host (
    Host_tax_id int NOT NULL,
    host_name Varchar(20) NOT NULL,
    Virus_Virus_tax_id int NOT NULL,
    HL_Host_lineage_id int NOT NULL,
    CONSTRAINT Host_pk PRIMARY KEY (Host_tax_id)
);

-- Table: VL
CREATE TABLE VL (
    viral_lineage_id int NOT NULL,
    virus_lineage Varchar(20) NOT NULL,
    CONSTRAINT VL_pk PRIMARY KEY (viral_lineage_id)
);

-- Table: Virus
CREATE TABLE Virus (
    Virus_Tax_id int NOT NULL,
    virus_name Varchar(20) NOT NULL,
    kegg_genome Varchar(6) NULL,
    refseq_id char(9) NOT NULL,
    VL_viral_lineage_id int NOT NULL,
    CONSTRAINT Virus_pk PRIMARY KEY (Virus_Tax_id)
);

-- Table: diseases
CREATE TABLE diseases (
    Disease_id int NOT NULL,
    Kind_disease varchar(20) NOT NULL,
    Kegg_disease Varchar(20) NOT NULL,
    Virus_Virus_tax_id int NOT NULL,
    CONSTRAINT diseases_pk PRIMARY KEY (Disease_id)
);

-- foreign keys
-- Reference: Host_HL (table: Host)
ALTER TABLE Host ADD CONSTRAINT Host_HL FOREIGN KEY Host_HL (HL_Host_lineage_id)
    REFERENCES HL (Host_lineage_id);

-- Reference: Host_Virus (table: Host)
ALTER TABLE Host ADD CONSTRAINT Host_Virus FOREIGN KEY Host_Virus (Virus_Virus_tax_id)
    REFERENCES Virus (Virus_Tax_id);

-- Reference: Virus_VL (table: Virus)
ALTER TABLE Virus ADD CONSTRAINT Virus_VL FOREIGN KEY Virus_VL (VL_viral_lineage_id)
    REFERENCES VL (viral_lineage_id);

-- Reference: diseases_Virus (table: diseases)
ALTER TABLE diseases ADD CONSTRAINT diseases_Virus FOREIGN KEY diseases_Virus (Virus_Virus_tax_id)
    REFERENCES Virus (Virus_Tax_id);

-- End of file.

