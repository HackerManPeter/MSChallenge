import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateBookDto } from './dto/create-book.dto';
import { UpdateBookDto } from './dto/update-book.dto';
import { Book } from './entities/book.entity';

@Injectable()
export class BooksService {
  constructor(
    @InjectRepository(Book)
    private readonly bookRepository: Repository<Book>,
  ) {}

  async create(createBookDto: CreateBookDto): Promise<CreateBookDto> {
    try {
      return this.bookRepository.save(createBookDto);
    } catch (error) {
      throw new BadRequestException();
    }
  }

  findAll(): Promise<Book[]> {
    return this.bookRepository.find({});
  }

  async findByPublisher() {
    return this.bookRepository.find({ order: { book_publisher: 'DESC' } });
  }

  async findOne(id: number): Promise<Book> {
    try {
      const book = await this.bookRepository.findOneBy({ book_ID: id });

      if (!book) {
        throw new NotFoundException();
      }
      return book;
    } catch (error) {
      return error;
    }
  }

  async update(id: number, updateBookDto: UpdateBookDto): Promise<Book> {
    try {
      const book = await this.bookRepository.findOneBy({ book_ID: id });

      if (!book) {
        throw new NotFoundException();
      }

      const updatedBook = await this.bookRepository.update(id, updateBookDto);

      if (!updatedBook) {
        throw new BadRequestException();
      }

      return this.bookRepository.findOneBy({ book_ID: id });
    } catch (error) {
      console.log('err');
      return error;
    }
  }

  async remove(id: number): Promise<Book> {
    try {
      const book = await this.bookRepository.findOneBy({ book_ID: id });

      if (!book) {
        throw new NotFoundException();
      }

      return this.bookRepository.remove(book);
    } catch (error) {
      return error;
    }
  }
}
