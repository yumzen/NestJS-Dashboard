import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import configSetting from './common/config/config';
import { PrismaModule } from './common/prisma/prisma.module';
import { UserService } from './user/user.service';
import { UserModule } from './user/user.module';
import { UserController } from './user/user.controller';

@Module({
  imports: [
    ConfigModule.forRoot({
      load: [configSetting],
      isGlobal: true,
    }),
    PrismaModule,
    UserModule,
  ],
  controllers: [AppController, UserController],
  providers: [AppService, UserService],
})
export class AppModule {}
