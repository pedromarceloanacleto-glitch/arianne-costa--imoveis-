CREATE TABLE `admin_identity` (
	`email` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `daily_metrics` (
	`day` text NOT NULL,
	`route` text NOT NULL,
	`kind` text NOT NULL,
	`count` integer DEFAULT 0 NOT NULL,
	PRIMARY KEY(`day`, `route`, `kind`)
);
--> statement-breakpoint
CREATE TABLE `leads` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`phone` text NOT NULL,
	`email` text DEFAULT '' NOT NULL,
	`goal` text NOT NULL,
	`wish` text DEFAULT '' NOT NULL,
	`status` text DEFAULT 'Novo' NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `idx_leads_created_at` ON `leads` (`created_at`);--> statement-breakpoint
CREATE TABLE `property_overrides` (
	`id` text PRIMARY KEY NOT NULL,
	`data` text NOT NULL,
	`revision` integer DEFAULT 1 NOT NULL,
	`updated_at` text NOT NULL
);
