import {MigrationInterface, QueryRunner} from "typeorm";

export class FixBooking1683012205038 implements MigrationInterface {
    name = 'FixBooking1683012205038'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`name\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`number\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`email\` varchar(255) NOT NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`email\``);
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`number\``);
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`name\``);
    }

}
