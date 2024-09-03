import { IsEthereumAddress, MaxLength } from 'class-validator';

export class CreateUserInput {
  @IsEthereumAddress()
  @MaxLength(256)
  address!: string;
}
