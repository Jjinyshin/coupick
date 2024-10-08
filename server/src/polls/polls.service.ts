import { ForbiddenException, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Poll } from './polls.schema';
import { Model } from 'mongoose';
import { InjectModel } from '@nestjs/mongoose';
import { User } from 'src/users/users.schema';

@Injectable()
export class PollsService {
  constructor(
    private readonly jwtService: JwtService,
    @InjectModel(Poll.name) private pollModel: Model<Poll>
  ) {}

  auth(token: string) {
    if (!token) {
      throw new UnauthorizedException();
    }

    try {
      return this.jwtService.verify(token?.substring(7)) as User;
    } catch (e) {
      throw new ForbiddenException();
    }
  }

  async getPoll(pollId: string) {
    return await this.pollModel.findById(pollId).lean();
  }

  async listPolls(userId: string) {
    return await this.pollModel.aggregate([
      {
        $match: {
          // likers: { $nin: [ userId ] },
          // dislikers: { $nin: [ userId ] }
        }
      },
      {
        $sample: { size: 60 }
      }
    ]) as Poll[];
  }

  async createPoll(
    price: number,
    content: string,
    thumbnail: string,
    coupangUrl: string,
    likers: string[] = [],
    dislikers: string[] = [],
    createdAt?: Date
  ) {
    const poll = !createdAt
      ? await this.pollModel.create({
        price,
        content,
        thumbnail,
        coupangUrl,
        likers,
        dislikers
      })
      : await this.pollModel.create({
        price,
        content,
        thumbnail,
        coupangUrl,
        likers,
        dislikers,
        createdAt
      });

    return poll;
  }

  async likePoll(
    pollId: string,
    userId: string,
    name: string,
    like: boolean,
    comment?: string
  ) {
    const updateQuery = { '$push': {} };
    if (like) {
      updateQuery['$push']['likers'] = userId;
    } else {
      updateQuery['$push']['dislikers'] = userId;
    }
    if (!!comment) {
      updateQuery['$push']['comments'] = {
        userId,
        name,
        content: comment,
        isLiked: like
      };
    }

    await this.pollModel.updateOne(
      { _id: pollId },
      updateQuery
    );
  }

  async deletePollAll() {
    await this.pollModel.deleteMany({});
  }
}
