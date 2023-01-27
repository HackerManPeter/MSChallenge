import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Book {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column()
  edition: string;

  @Column()
  author: string;

  @Column()
  publisher: string;

  @Column()
  copies: number;

  @Column()
  cost: number;

  @Column()
  remarks: string;
}
