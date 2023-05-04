import {MigrationInterface, QueryRunner} from "typeorm";

export class ChangeDB1681917299207 implements MigrationInterface {
    name = 'ChangeDB1681917299207'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`users\` DROP COLUMN \`opt\``);
        await queryRunner.query(`ALTER TABLE \`users\` ADD \`otp\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`hotels\` ADD \`latitude\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`hotels\` ADD \`longitude\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`password\` \`password\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`name\` \`name\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`email\` \`email\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` DROP COLUMN \`bdd\``);
        await queryRunner.query(`ALTER TABLE \`users\` ADD \`bdd\` datetime NOT NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`users\` DROP COLUMN \`bdd\``);
        await queryRunner.query(`ALTER TABLE \`users\` ADD \`bdd\` date NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`email\` \`email\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`name\` \`name\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`users\` CHANGE \`password\` \`password\` varchar(255) NULL`);
        await queryRunner.query(`ALTER TABLE \`hotels\` DROP COLUMN \`longitude\``);
        await queryRunner.query(`ALTER TABLE \`hotels\` DROP COLUMN \`latitude\``);
        await queryRunner.query(`ALTER TABLE \`users\` DROP COLUMN \`otp\``);
        await queryRunner.query(`ALTER TABLE \`users\` ADD \`opt\` varchar(255) NULL`);
    }

}
