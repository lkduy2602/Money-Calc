-- categories definition

CREATE TABLE "categories" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" text NOT NULL,
    "normalized_text" text NOT NULL
);

-- expense_types definition

CREATE TABLE "expense_types" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" text NOT NULL,
    "normalized_text" text NOT NULL,
    "status" integer NOT NULL DEFAULT(1)
);

-- orders definition

CREATE TABLE "orders" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "date" text NOT NULL DEFAULT(datetime()),
    "total_amount" real NOT NULL,
    "status" integer NOT NULL DEFAULT(0),
    "cancel_reason" text
);

-- price_product_map definition

CREATE TABLE "price_product_map" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "price" real NOT NULL,
    "product_ids" text NOT NULL
);

CREATE UNIQUE INDEX "price_product_map_price_IDX" ON "price_product_map" ("price");

-- expenses definition

CREATE TABLE "expenses" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "date" text NOT NULL DEFAULT(datetime()),
    "amount" real NOT NULL,
    "description" text,
    "expense_type_id" integer NOT NULL,
    CONSTRAINT "expenses_expense_types_FK" FOREIGN KEY ("expense_type_id") REFERENCES "expense_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- order_details definition

CREATE TABLE "order_details" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "product_name" text NOT NULL,
    "quantity" integer NOT NULL,
    "price_per_item" real NOT NULL,
    "order_id" integer NOT NULL,
    CONSTRAINT "order_details_order_FK" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- products definition

CREATE TABLE "products" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" text NOT NULL,
    "normalized_text" text NOT NULL,
    "status" integer NOT NULL DEFAULT(1),
    "category_id" integer,
    CONSTRAINT "products_categories_FK" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- product_price_history definition

CREATE TABLE "product_price_history" (
    "created_at" text NOT NULL DEFAULT(datetime()),
    "updated_at" text NOT NULL DEFAULT(datetime()),
    "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL,
    "price" real NOT NULL,
    "effective_date" text NOT NULL DEFAULT(datetime()),
    "price_type" integer NOT NULL DEFAULT(1),
    "product_id" integer NOT NULL,
    CONSTRAINT "price_history_products_FK" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);