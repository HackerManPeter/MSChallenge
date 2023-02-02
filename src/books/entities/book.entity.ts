import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Book {
  @PrimaryGeneratedColumn()
  book_ID: number;

  @Column()
  book_title: string;

  @Column()
  book_edition: string;

  @Column()
  book_author: string;

  @Column()
  book_publisher: string;

  @Column()
  book_copies: number;

  @Column()
  book_cost: number;

  @Column({
    nullable: true,
    length: 350,
  })
  book_remarks: string;
}
