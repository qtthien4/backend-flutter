import {MigrationInterface, QueryRunner} from "typeorm";

export class AddLocation1682955605290 implements MigrationInterface {
    name = 'AddLocation1682955605290'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`hotels\` ADD \`location\` varchar(255) NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`hotels\` DROP COLUMN \`location\``);
    }

}
