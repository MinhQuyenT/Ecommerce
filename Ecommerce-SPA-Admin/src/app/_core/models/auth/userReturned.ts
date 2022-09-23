import { UserForLogged } from "./userForLogged";

export interface UserReturned {
  token: string;
  refreshToken: string;
  user: UserForLogged;
}