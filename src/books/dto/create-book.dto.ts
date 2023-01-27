import { IsNumber, IsString } from 'class-validator';

export class CreateBookDto {
  @IsString()
  title: string;

  @IsString()
  edition: string;

  @IsString()
  author: string;

  @IsString()
  publisher: string;

  @IsNumber()
  copies: number;

  @IsNumber()
  cost: number;

  @IsString()
  remarks: string;
}
