import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Staff {
  @PrimaryGeneratedColumn()
  staff_id: number;

  @Column()
  staff_firstname: string;

  @Column()
  staff_lastname: string;

  @Column()
  staff_mobilenumber: string;

  @Column()
  staff_email: string;

  @Column()
  staff_password: string;

  @Column()
  staff_authsalt: string;

  @Column()
  staff_category: string;
}
