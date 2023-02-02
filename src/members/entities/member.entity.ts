import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import { MemberGender } from '../enum/member.enums';

@Entity()
export class Member {
  @PrimaryGeneratedColumn()
  member_ID: number;

  @Column()
  member_firstname: string;

  @Column()
  member_lastname: string;

  @Column()
  dateofBirth: Date;

  @Column({
    type: 'enum',
    enum: MemberGender,
  })
  member_gender: MemberGender;

  @Column({ nullable: true })
  member_mobile: string;

  @Column({ nullable: true })
  member_email: string;
}
