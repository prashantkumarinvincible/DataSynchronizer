CREATE TABLE dbo.EventLog (
    Id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    EventType   INT           NOT NULL,
    Status      INT           NOT NULL DEFAULT(0), -- 0 Pending
    PayloadJson NVARCHAR(MAX) NULL,
    Origin      NVARCHAR(16)  NULL,                -- "MSSQL" or "ORACLE"
    CreatedAt   DATETIME2(3)  NOT NULL DEFAULT SYSUTCDATETIME(),
    UpdatedAt   DATETIME2(3)  NULL,
    RetryCount  INT           NULL,
    LastError   NVARCHAR(1000) NULL
);
CREATE INDEX IX_EventLog_Status_CreatedAt ON dbo.EventLog(Status, CreatedAt);
