PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "_prisma_migrations" (
    "id"                    TEXT PRIMARY KEY NOT NULL,
    "checksum"              TEXT NOT NULL,
    "finished_at"           DATETIME,
    "migration_name"        TEXT NOT NULL,
    "logs"                  TEXT,
    "rolled_back_at"        DATETIME,
    "started_at"            DATETIME NOT NULL DEFAULT current_timestamp,
    "applied_steps_count"   INTEGER UNSIGNED NOT NULL DEFAULT 0
);
INSERT INTO _prisma_migrations VALUES('642e0c57-dd86-4041-9c16-9ff768589e29','6c1e35e0ae5cc56c6a8ad207890f83484f45c4b1947240187f6faeab12615f72',1661508250066,'20220826100409_init',NULL,NULL,1661508249908,1);
CREATE TABLE IF NOT EXISTS "Organization" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO Organization VALUES(1,'organization0');
INSERT INTO Organization VALUES(2,'organization1');
INSERT INTO Organization VALUES(3,'organization2');
INSERT INTO Organization VALUES(4,'organization3');
INSERT INTO Organization VALUES(5,'organization4');
CREATE TABLE IF NOT EXISTS "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,
    CONSTRAINT "User_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO User VALUES(1,'Alice',2);
INSERT INTO User VALUES(2,'Bob',1);
INSERT INTO User VALUES(3,'Charlie',3);
INSERT INTO User VALUES(4,'Dave',4);
INSERT INTO User VALUES(5,'Eve',5);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Organization',5);
INSERT INTO sqlite_sequence VALUES('User',5);
CREATE UNIQUE INDEX "Organization_name_key" ON "Organization"("name");
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");
CREATE UNIQUE INDEX "User_organizationId_key" ON "User"("organizationId");
COMMIT;
