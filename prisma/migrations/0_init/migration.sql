-- CreateEnum
CREATE TYPE "exclusivity" AS ENUM ('PUBLIC', 'EXCLUSIVE', 'PRIVATE');

-- CreateTable
CREATE TABLE "alembic_version" (
    "version_num" VARCHAR(32) NOT NULL,

    CONSTRAINT "alembic_version_pkc" PRIMARY KEY ("version_num")
);

-- CreateTable
CREATE TABLE "dream" (
    "id" SERIAL NOT NULL,
    "dream" VARCHAR(6000),
    "exclusivity" "exclusivity",
    "sleep_start" VARCHAR,
    "sleep_end" VARCHAR,
    "keywords" VARCHAR[],
    "log_date" TIMESTAMP(6),
    "likes" INTEGER,
    "user_id" INTEGER,
    "who_liked" VARCHAR[],

    CONSTRAINT "dream_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "friends" (
    "id" SERIAL NOT NULL,
    "friend_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "friends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "interpretation" (
    "id" SERIAL NOT NULL,
    "interpretation" VARCHAR(6000),
    "log_date" TIMESTAMP(6),
    "dream_id" INTEGER,
    "exclusivity" "exclusivity",
    "interpreter_id" INTEGER,

    CONSTRAINT "interpretation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "message" (
    "id" SERIAL NOT NULL,
    "message" VARCHAR(6000),
    "log_date" TIMESTAMP(6),
    "sender_id" INTEGER,
    "receiver_id" INTEGER,

    CONSTRAINT "message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "email" VARCHAR,
    "username" VARCHAR,
    "password" VARCHAR(528),
    "location" VARCHAR(64),
    "token" VARCHAR,
    "token_expiration" TIMESTAMPTZ(6),
    "liked_dreams" INTEGER[],

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ix_dream_keywords" ON "dream"("keywords");

-- CreateIndex
CREATE INDEX "ix_dream_log_date" ON "dream"("log_date");

-- CreateIndex
CREATE INDEX "ix_interpretation_log_date" ON "interpretation"("log_date");

-- CreateIndex
CREATE INDEX "ix_message_log_date" ON "message"("log_date");

-- CreateIndex
CREATE UNIQUE INDEX "ix_user_email" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ix_user_username" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "ix_user_token" ON "user"("token");

-- AddForeignKey
ALTER TABLE "dream" ADD CONSTRAINT "dream_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "friends" ADD CONSTRAINT "friends_friend_id_fkey" FOREIGN KEY ("friend_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "friends" ADD CONSTRAINT "friends_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "interpretation" ADD CONSTRAINT "interpretation_dream_id_fkey" FOREIGN KEY ("dream_id") REFERENCES "dream"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "interpretation" ADD CONSTRAINT "interpretation_interpreter_id_fkey" FOREIGN KEY ("interpreter_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "message" ADD CONSTRAINT "message_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "message" ADD CONSTRAINT "message_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

