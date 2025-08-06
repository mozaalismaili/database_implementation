-- Department
CREATE TABLE DEPT (
    DUNM INT PRIMARY KEY,
    SSN INT,             -- Manager SSN
    HIRDATE DATE,
    DN VARCHAR(100)      -- Department name
);

-- Location (Multivalued attribute of DEPT)
CREATE TABLE LOC (
    DUNM INT,
    LOC VARCHAR(100),
    PRIMARY KEY (DUNM, LOC),
    FOREIGN KEY (DUNM) REFERENCES DEPT(DUNM)
);

-- Employee
CREATE TABLE EMP (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    super_id INT,                      -- Recursive FK
    BD DATE,
    DUNM INT,
    FOREIGN KEY (DUNM) REFERENCES DEPT(DUNM),
    FOREIGN KEY (super_id) REFERENCES EMP(SSN)
);

-- Project
CREATE TABLE PROJ (
    PNUM INT PRIMARY KEY,
    PN VARCHAR(100),     -- Project Name
    LOC VARCHAR(100),
    CITY VARCHAR(100),
    DUNM INT,
    FOREIGN KEY (DUNM) REFERENCES DEPT(DUNM)
);

-- Works_On (many-to-many between EMP and PROJ)
CREATE TABLE WORK (
    SSN INT,
    PNUM INT,
    hours DECIMAL(5,2),
    PRIMARY KEY (SSN, PNUM),
    FOREIGN KEY (SSN) REFERENCES EMP(SSN),
    FOREIGN KEY (PNUM) REFERENCES PROJ(PNUM)
);

-- Dependent
CREATE TABLE depndent (
    dnum VARCHAR(50),        
    BD DATE,
    GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
    ssn INT,                  -- Employee SSN (owner)
    PRIMARY KEY (ssn, dnum),
    FOREIGN KEY (ssn) REFERENCES EMP(SSN) ON DELETE CASCADE
);
