import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Staff {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  firstname: string;

  @Column()
  lastname: string;

  @Column()
  mobilenumber: string;

  @Column()
  email: string;

  @Column()
  password: string;

  @Column()
  authsalt: string;

  @Column()
  category: string;
}
