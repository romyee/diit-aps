CREATE TABLE "application_form_fields" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "application_form_id" integer, "form_field_id" integer, "field_answer" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "application_forms" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "form_id" integer, "tracking_id" varchar(255), "comment" varchar(255), "status" integer DEFAULT 1 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "application_processes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "application_form_id" integer, "refferer_id" integer, "reffer_to_id" integer, "purpose" varchar(255), "message" text, "status" integer DEFAULT 1, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "form_fields" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "form_id" integer, "label" varchar(255), "description" text, "answer_type" varchar(255), "mandetory" boolean, "answer_opitons" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "forms" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255) NOT NULL, "sub_title" varchar(255), "requirements" text, "description" text, "note" text, "last_date" date NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255) NOT NULL, "last_name" varchar(255), "email" varchar(255) NOT NULL, "official_id" varchar(255) NOT NULL, "permanent_address" text, "present_addresss" text NOT NULL, "contact_number" varchar(255) NOT NULL, "role" integer DEFAULT 1 NOT NULL, "salt_key" varchar(255) NOT NULL, "hashed_password" varchar(255) NOT NULL, "recover_hash" varchar(255), "status" integer DEFAULT 1 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_application_form_fields_on_application_form_id" ON "application_form_fields" ("application_form_id");
CREATE INDEX "index_application_form_fields_on_form_field_id" ON "application_form_fields" ("form_field_id");
CREATE INDEX "index_application_forms_on_form_id" ON "application_forms" ("form_id");
CREATE INDEX "index_application_forms_on_user_id" ON "application_forms" ("user_id");
CREATE INDEX "index_application_processes_on_application_form_id" ON "application_processes" ("application_form_id");
CREATE INDEX "index_application_processes_on_reffer_to_id" ON "application_processes" ("reffer_to_id");
CREATE INDEX "index_application_processes_on_refferer_id" ON "application_processes" ("refferer_id");
CREATE INDEX "index_application_processes_on_status" ON "application_processes" ("status");
CREATE INDEX "index_form_fields_on_form_id" ON "form_fields" ("form_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20121110094957');

INSERT INTO schema_migrations (version) VALUES ('20121110112544');

INSERT INTO schema_migrations (version) VALUES ('20121110113446');

INSERT INTO schema_migrations (version) VALUES ('20121112051344');

INSERT INTO schema_migrations (version) VALUES ('20121112051649');

INSERT INTO schema_migrations (version) VALUES ('20121114174712');