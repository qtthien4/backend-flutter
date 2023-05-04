import {MigrationInterface, QueryRunner} from "typeorm";

export class AddImageInProvince1682827985901 implements MigrationInterface {
    name = 'AddImageInProvince1682827985901'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`provinces\` ADD \`image\` varchar(255) NULL`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`provinces\` DROP COLUMN \`image\``);
    }

}
