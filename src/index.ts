import { send } from "micro";
import { IncomingMessage, ServerResponse } from "http";

export const QOTD_DB = [
  "The breaking of a wave cannot explain the whole sea.",
  "Goals transform a random walk into a chase.",
  "Sometimes in life, random things can blind-side you.",
  "I believe life is an intelligent thing: that things aren't random."
];

export function pick(db: Array<string>) {
  return db[Math.floor(Math.random() * db.length)];
}

export default (req: IncomingMessage, res: ServerResponse) =>
  send(res, 200, { qotd: pick(QOTD_DB) });
