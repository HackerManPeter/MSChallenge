import { IsNumber, IsString } from 'class-validator';

export class CreateBookDto {
  @IsString()
  book_title: string;

  @IsString()
  book_edition: string;

  @IsString()
  book_author: string;

  @IsString()
  book_publisher: string;

  @IsNumber()
  book_copies: number;

  @IsNumber()
  book_cost: number;

  @IsString()
  book_remarks: string;
}
