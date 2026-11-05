/* =====================================================================
   ARU KORE database script  (SQL Server 2019 / Express / LocalDB)
   Safe to run more than once: it only creates what is missing.
   Run in SSMS: open this file, then press F5 (Execute).
   ===================================================================== */

IF DB_ID(N'ARUKORE_DB') IS NULL
    CREATE DATABASE ARUKORE_DB;
GO

USE ARUKORE_DB;
GO

/* ---------- Skills (shown on the home page) ---------- */
IF OBJECT_ID(N'dbo.Skills', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Skills
    (
        SkillId      INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Skills PRIMARY KEY,
        SkillName    NVARCHAR(100)     NOT NULL,
        DisplayOrder INT               NOT NULL CONSTRAINT DF_Skills_DisplayOrder DEFAULT (0),
        IsActive     BIT               NOT NULL CONSTRAINT DF_Skills_IsActive DEFAULT (1)
    );
END
GO

/* ---------- Projects (shown on the home page) ---------- */
IF OBJECT_ID(N'dbo.Projects', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Projects
    (
        ProjectId        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Projects PRIMARY KEY,
        ProjectName      NVARCHAR(150)     NOT NULL,
        ShortDescription NVARCHAR(500)     NOT NULL,
        Technologies     NVARCHAR(250)     NULL,
        ProjectType      NVARCHAR(50)      NOT NULL CONSTRAINT DF_Projects_Type DEFAULT (N'Project'),
        DisplayOrder     INT               NOT NULL CONSTRAINT DF_Projects_DisplayOrder DEFAULT (0),
        IsActive         BIT               NOT NULL CONSTRAINT DF_Projects_IsActive DEFAULT (1),
        IsFeatured       BIT               NOT NULL CONSTRAINT DF_Projects_IsFeatured DEFAULT (0)
    );
END
GO

/* ---------- Contact messages (written by the Contact page) ---------- */
IF OBJECT_ID(N'dbo.ContactMessages', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ContactMessages
    (
        MessageId    INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ContactMessages PRIMARY KEY,
        SenderName   NVARCHAR(100)     NOT NULL,
        SenderEmail  NVARCHAR(150)     NOT NULL,
        Subject      NVARCHAR(150)     NULL,
        MessageText  NVARCHAR(2000)    NOT NULL,
        CreatedAt    DATETIME2(0)      NOT NULL CONSTRAINT DF_ContactMessages_CreatedAt DEFAULT (SYSUTCDATETIME()),
        IsRead       BIT               NOT NULL CONSTRAINT DF_ContactMessages_IsRead DEFAULT (0)
    );
END
GO

/* ---------- Sample data (only inserted when the table is empty) ---------- */
IF NOT EXISTS (SELECT 1 FROM dbo.Skills)
BEGIN
    INSERT INTO dbo.Skills (SkillName, DisplayOrder) VALUES
        (N'C#', 1),
        (N'ASP.NET Web Forms', 2),
        (N'SQL Server', 3),
        (N'HTML & CSS', 4),
        (N'JavaScript', 5),
        (N'Git & GitHub', 6);
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Projects)
BEGIN
    INSERT INTO dbo.Projects (ProjectName, ShortDescription, Technologies, ProjectType, DisplayOrder, IsFeatured) VALUES
        (N'ARU KORE Portfolio',
         N'This personal website: a Web Forms portfolio that reads its skills and projects from SQL Server and stores contact messages.',
         N'ASP.NET Web Forms, C#, SQL Server, CSS', N'Web App', 1, 1),
        (N'Sample Project Two',
         N'Replace this row with a real project. Edit it in SSMS or with an UPDATE statement.',
         N'Add your technologies here', N'Project', 2, 1),
        (N'Sample Project Three',
         N'Another placeholder. Set IsFeatured = 0 to hide a project from the home page.',
         N'Add your technologies here', N'Project', 3, 1);
END
GO

/* ---------- Quick check ---------- */
SELECT COUNT(*) AS SkillCount   FROM dbo.Skills;
SELECT COUNT(*) AS ProjectCount FROM dbo.Projects;
GO
