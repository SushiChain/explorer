module Block {
  fun empty : Block {
    {
      index = -1,
      transactions = [],
      nonce = Maybe.just(0),
      prevHash = "",
      merkleTreeRoot = "",
      timestamp = 0,
      difficulty = Maybe.just(0),
      kind = "",
      address = "",
      publicKey = Maybe.just(""),
      signR = Maybe.just(""),
      signS = Maybe.just(""),
      hash = Maybe.just("")
    }
  }

  fun decode (object : Object) : Result(Object.Error, Block) {
    decode object as Block
  }

  fun renderHeaderFooterTable : Html {
    <tr>
      <th>
        "Index"
      </th>

      <th>
        "Time"
      </th>

      <th>
        "Number of tx"
      </th>
    </tr>
  }

  fun renderLine (block : Block) : Html {
    <tr>
      <td>
        <a href={"/blocks/show/" + Number.toString(block.index)}>
          <{ Number.toString(block.index) }>
        </a>
      </td>

      <td>
        <{ DDate.formatFromTS(block.timestamp) }>
      </td>

      <td>
        <{ Number.toString(Array.size(block.transactions)) }>
      </td>
    </tr>
  }
}
