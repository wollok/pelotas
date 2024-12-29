import flatfile from 'flat-file-db'

let highscore = 0
const db = flatfile('data/my.db')

db.on('open', () => {
  highscore = db.get('highscore') || 0
})

const manager = {

  *highscore(this: any, self: any): any {
    return yield  *this.reify(highscore)
  },

  *saveHighscore(this: any, self: any, newHighscore: number): any {
    highscore = newHighscore.innerValue
    db.put('highscore', highscore)
  },
}

export { manager }
