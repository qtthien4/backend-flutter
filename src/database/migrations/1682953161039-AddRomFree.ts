import {MigrationInterface, QueryRunner} from "typeorm";

export class AddRomFree1682953161039 implements MigrationInterface {
    name = 'AddRomFree1682953161039'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`hotels\` ADD \`roomAvailable\` int NOT NULL DEFAULT '5'`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`hotels\` DROP COLUMN \`roomAvailable\``);
    }

}
