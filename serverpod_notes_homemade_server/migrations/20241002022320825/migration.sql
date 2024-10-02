BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR serverpod_notes_homemade
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_notes_homemade', '20241002022320825', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241002022320825', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
