// JavaScriptでのトークン生成の例（payjp.jsを使用）
Payjp.setPublicKey('your_public_key');
const card = {
  number: '4242424242424242',
  exp_month: '12',
  exp_year: '23',
  cvc: '123',
};

Payjp.createToken(card, (status, response) => {
  if (status === 200) {
    const token = response.id;
    // トークンをサーバーサイドに送信する処理を実装
    sendTokenToServer(token);
  } else {
    // エラーハンドリング
    console.error(response.error.message);
  }
});