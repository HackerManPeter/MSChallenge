import { IsNumber, IsOptional, IsString } from 'class-validator';

export class UpdateBookDto {
  @IsString()
  @IsOptional()
  title: string;

  @IsString()
  @IsOptional()
  edition: string;

  @IsString()
  @IsOptional()
  author: string;

  @IsString()
  @IsOptional()
  publisher: string;

  @IsNumber()
  @IsOptional()
  copies: number;

  @IsNumber()
  @IsOptional()
  cost: number;

  @IsString()
  @IsOptional()
  remarks: string;
}
