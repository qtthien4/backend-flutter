## Struct Project
```
  ├── ...
  ├── public                          # static asset files 
  ├── src                     
  │   ├── common                      # Base abstract, constant, decorators, util functions
  │   ├── database
  │   │   └── migrations              # Migration files (auto-generated)
  │   ├── entities                    
  │       ├── user.entity.ts          # Entity for user table
  │       └── ...
  │   └── modules             
  │       ├── user                    
  │       │   ├── user.controller     # User controller
  │       │   ├── user.dto.ts         # Declare dto for user
  │       │   ├── user.modules.ts     # User module file
  │       │   ├── user.repository.ts  # Repository for table user
  │       │   └── user.service.ts     # User service handle business logic
  │       └── ...
  ├── services                        # External service like mail service, firebase service
  │   ├── fcm.service.ts              # Fcm service
  │   └──
  └── ...
```
## Installation server
- Essential libraries: yarn add @nestjs/config @nestjs/platform-express @nestjs/jwt @nestjs/passport passport passport-jwt passport-local @nestjs/platform-express @nestjs/swagger swagger-ui-express @nestjs/typeorm typeorm typeorm-transactional-cls-hooked bcryptjs class-transformer class-validator date-fns guid-typescript hbs jwt-decode lodash mysql2 rxjs

- Essential dev libraries: yarn add -D @types/multer

## Update database
>NOTE: Always pull lastest migration files to update database properly. BE SURE run command `npm run database-update` before add migration
- Config database in `ormconfig.env`
- Generate migration file: `npm run add-migration <NAME_MIGRATION>`
- Update database with new change: `npm run database-update`