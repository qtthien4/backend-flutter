import {MigrationInterface, QueryRunner} from "typeorm";

export class AddBooking1682996837675 implements MigrationInterface {
    name = 'AddBooking1682996837675'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`chooseDate\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`depTime\` varchar(255) NOT NULL`);
        await queryRunner.query(`ALTER TABLE \`bookings\` ADD \`person\` varchar(255) NOT NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`person\``);
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`depTime\``);
        await queryRunner.query(`ALTER TABLE \`bookings\` DROP COLUMN \`chooseDate\``);
    }

}
