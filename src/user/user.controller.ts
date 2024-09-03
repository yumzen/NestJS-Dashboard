import { Body, Controller, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserInput } from './create-user.input';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @Post('')
  async create(@Body() userInput: CreateUserInput) {
    const user = await this.userService.create(userInput);
    return user;
  }
}
