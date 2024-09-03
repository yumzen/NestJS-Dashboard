import { Injectable } from '@nestjs/common';
import { CreateUserInput } from './create-user.input';
import { PrismaService } from 'src/common/prisma/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}
  async create(userInput: CreateUserInput) {
    return this.prisma.user.create({
      data: { ...userInput },
    });
  }
}
