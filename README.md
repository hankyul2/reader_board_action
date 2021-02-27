# Reader Board Actions

This action clone public repo and private repo together. After cloing, It execute desired operations.
I am not going to explain what is the desired operations.

Docker Images
This action is based on python 3.8 docker images

## Inputs

### `public_repo`

**Required** The name of public repo. ex) ai_2021_readerboard

### `public_name`

**Required** The name of admin of public repo. ex) hankyul2

### `public_author`

**Required** The e-mail address of admin of public repo. ex) consistant1y@ajou.ac.kr

### `private_repo`

**Required** The name of private repo. ex) ai_2021_score

### `private_name`

**Required** The name of admin of private repo. ex) hankyul2

### `private_author`

**Required** The e-mail address of admin of private repo. ex) consistant1y@ajou.ac.kr

## Example usage

```yaml
- name: Reader Board Update
  id: hello
  uses: hankyul2/reader_board_action@v3.2
  env:
    API_TOKEN_GITHUB: ${{ secrets.pat }}
  with:
    public_repo: ai_2020_readerboard
    public_name: hankyul2
    public_author: consistant1y@ajou.ac.kr
    private_repo: ${{ secrets.repo }}
    private_name: ${{ secrets.name }}
    private_author: ${{ secrets.author }}
```