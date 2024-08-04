CREATE TABLE "characters" (
  "id" integer PRIMARY KEY,
  "FK_quotes_id" integer,
  "FK_cosplayers_id" integer,
  "origin" text,
  "name" varchar,
  "hair_description" varchar,
  "color_eyes" varchar,
  "accessories" varchar,
  "gender" varchar,
  "skin_color" varchar,
  "clothes_description" varchar,
  "reference_image_path" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "cosplayers" (
  "id" integer PRIMARY KEY,
  "FK_characters_id" integer,
  "FK_cosplay_materials_id" integer,
  "FK_events_id" integer,
  "name" varchar,
  "instagram" varchar(50),
  "best_photo_path" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "cosplay_materials" (
  "id" integer PRIMARY KEY,
  "contact" bool,
  "role" varchar,
  "materials" varchar,
  "top_pieces" varchar,
  "bottom_pieces" varchar,
  "leg_pieces" varchar,
  "feet_pieces" varchar,
  "accessories" varchar,
  "cost_estimate" float,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "events" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "category" varchar,
  "place" integer,
  "won" bool,
  "date" date,
  "location" varchar,
  "prizes" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "quotes" (
  "id" integer PRIMARY KEY,
  "FK_characters_id" integer,
  "text" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "character_events" (
  "id" integer PRIMARY KEY,
  "FK_characters_id" integer,
  "FK_events_id" integer
);

CREATE TABLE "administrators" (
  "id" integer PRIMARY KEY,
  "active" bool,
  "username" varchar(50),
  "password" bytea,
  "created_at" timestamp,
  "updated_at" timestamp
);

COMMENT ON TABLE "characters" IS 'Basic informations of the character';

COMMENT ON TABLE "cosplayers" IS 'Basic informations of the cosplayer that its cosplaying about the charcter';

COMMENT ON COLUMN "events"."category" IS 'Content of the post';

ALTER TABLE "characters" ADD FOREIGN KEY ("FK_quotes_id") REFERENCES "quotes" ("id");

CREATE TABLE "cosplayers_characters" (
  "cosplayers_id" integer,
  "characters_FK_cosplayers_id" integer,
  PRIMARY KEY ("cosplayers_id", "characters_FK_cosplayers_id")
);

ALTER TABLE "cosplayers_characters" ADD FOREIGN KEY ("cosplayers_id") REFERENCES "cosplayers" ("id");

ALTER TABLE "cosplayers_characters" ADD FOREIGN KEY ("characters_FK_cosplayers_id") REFERENCES "characters" ("FK_cosplayers_id");


CREATE TABLE "characters_cosplayers" (
  "characters_id" integer,
  "cosplayers_FK_characters_id" integer,
  PRIMARY KEY ("characters_id", "cosplayers_FK_characters_id")
);

ALTER TABLE "characters_cosplayers" ADD FOREIGN KEY ("characters_id") REFERENCES "characters" ("id");

ALTER TABLE "characters_cosplayers" ADD FOREIGN KEY ("cosplayers_FK_characters_id") REFERENCES "cosplayers" ("FK_characters_id");


CREATE TABLE "cosplay_materials_cosplayers" (
  "cosplay_materials_id" integer,
  "cosplayers_FK_cosplay_materials_id" integer,
  PRIMARY KEY ("cosplay_materials_id", "cosplayers_FK_cosplay_materials_id")
);

ALTER TABLE "cosplay_materials_cosplayers" ADD FOREIGN KEY ("cosplay_materials_id") REFERENCES "cosplay_materials" ("id");

ALTER TABLE "cosplay_materials_cosplayers" ADD FOREIGN KEY ("cosplayers_FK_cosplay_materials_id") REFERENCES "cosplayers" ("FK_cosplay_materials_id");


CREATE TABLE "events_cosplayers" (
  "events_id" integer,
  "cosplayers_FK_events_id" integer,
  PRIMARY KEY ("events_id", "cosplayers_FK_events_id")
);

ALTER TABLE "events_cosplayers" ADD FOREIGN KEY ("events_id") REFERENCES "events" ("id");

ALTER TABLE "events_cosplayers" ADD FOREIGN KEY ("cosplayers_FK_events_id") REFERENCES "cosplayers" ("FK_events_id");


ALTER TABLE "quotes" ADD FOREIGN KEY ("FK_characters_id") REFERENCES "characters" ("id");

CREATE TABLE "characters_character_events" (
  "characters_id" integer,
  "character_events_FK_characters_id" integer,
  PRIMARY KEY ("characters_id", "character_events_FK_characters_id")
);

ALTER TABLE "characters_character_events" ADD FOREIGN KEY ("characters_id") REFERENCES "characters" ("id");

ALTER TABLE "characters_character_events" ADD FOREIGN KEY ("character_events_FK_characters_id") REFERENCES "character_events" ("FK_characters_id");


CREATE TABLE "events_character_events" (
  "events_id" integer,
  "character_events_FK_events_id" integer,
  PRIMARY KEY ("events_id", "character_events_FK_events_id")
);

ALTER TABLE "events_character_events" ADD FOREIGN KEY ("events_id") REFERENCES "events" ("id");

ALTER TABLE "events_character_events" ADD FOREIGN KEY ("character_events_FK_events_id") REFERENCES "character_events" ("FK_events_id");

