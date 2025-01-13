CREATE TABLE "data"."form_land" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "id_form" int4 NOT NULL,
  "question_text" varchar(500) COLLATE "pg_catalog"."default",
  "answer_text" varchar(500) COLLATE "pg_catalog"."default",
  "date_create" timestamp(6),
  CONSTRAINT "form_land_pkey" PRIMARY KEY ("id")
)
;

ALTER TABLE "data"."form_land" 
  OWNER TO "postgres";

COMMENT ON COLUMN "data"."form_land"."id" IS 'Идентификатор';

COMMENT ON COLUMN "data"."form_land"."id_form" IS 'Идентификатор анкеты';

COMMENT ON COLUMN "data"."form_land"."question_text" IS 'Текст вопроса';

COMMENT ON COLUMN "data"."form_land"."answer_text" IS 'Текст ответа';

COMMENT ON COLUMN "data"."form_land"."date_create" IS 'Время ответа на анкету';