import { QOTD_DB, pick } from "../";

test("picks a random quote", () => {
  const quote = pick(QOTD_DB);
  expect(quote).toBeTruthy();
});

test("picks the only quote available", () => {
  const quote = pick(["A quote"]);
  expect(quote).toMatchSnapshot();
});
