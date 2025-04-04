import type { Channel } from './ChannelIterator';
import { RADIO_PREFIXES, WindowSize } from './constants';

/**
 * Once byond signals this via keystroke, it
 * ensures window size, visibility, and focus.
 */
export function windowOpen(channel: Channel): void {
  setWindowVisibility(true);
  Byond.sendMessage('open', { channel });
}

/**
 * Resets the state of the window and hides it from user view.
 * Sending "close" logs it server side.
 */
export function windowClose(): void {
  setWindowVisibility(false);
  Byond.winset('map', {
    focus: true,
  });
  Byond.sendMessage('close');
}

/**
 * Modifies the window size.
 */
export function windowSet(
  width = WindowSize.Width,
  size = WindowSize.Small,
): void {
  const sizeStr = `${width}x${size}`;

  Byond.winset('tgui_say.browser', {
    size: sizeStr,
  });

  Byond.winset('tgui_say', {
    size: sizeStr,
  });
}

/** Helper function to set window size and visibility */
function setWindowVisibility(visible: boolean): void {
  Byond.winset('tgui_say', {
    'is-visible': visible,
    size: `${WindowSize.Width}x${WindowSize.Small}`,
  });
}

const CHANNEL_REGEX = /^[:.]\w\s|^,b\s/;

/** Tests for a channel prefix, returning it or none */
export function getPrefix(
  value: string,
): keyof typeof RADIO_PREFIXES | undefined {
  if (!value || value.length < 3 || !CHANNEL_REGEX.test(value)) {
    return;
  }

  const adjusted = value
    .slice(0, 3)
    ?.toLowerCase()
    ?.replace('.', ':') as keyof typeof RADIO_PREFIXES;

  if (!RADIO_PREFIXES[adjusted]) {
    return;
  }

  return adjusted;
}

export function getMarkupString(
  inputText: string,
  markupType: string,
  startPosition: number,
  endPosition: number,
) {
  return `${inputText.substring(0, startPosition)}${markupType}${inputText.substring(startPosition, endPosition)}${markupType}${inputText.substring(endPosition)}`;
}
